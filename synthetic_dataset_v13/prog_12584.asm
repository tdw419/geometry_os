; DESCRIPTION: Composite: Sets a single purple pixel at (279, 126) then Places a cyan circle of radius 10 at center (141, 168) then Draws a white line from (206, 220) to (503, 42).
; PLAN: r0=279(x), r1=126(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=168(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=206(x1), r11=220(y1), r12=503(x2), r13=42(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 126
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 141
LDI r6, 168
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 206
LDI r11, 220
LDI r12, 503
LDI r13, 42
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
