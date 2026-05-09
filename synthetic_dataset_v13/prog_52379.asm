; DESCRIPTION: Composite: Sets a single purple pixel at (294, 166) then Places a cyan circle of radius 27 at center (223, 168) then Renders a magenta line between points (468, 32) and (452, 141).
; PLAN: r0=294(x), r1=166(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=168(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x1), r11=32(y1), r12=452(x2), r13=141(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 166
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 168
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 32
LDI r12, 452
LDI r13, 141
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
