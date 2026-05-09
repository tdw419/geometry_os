; DESCRIPTION: Composite: Places a cyan 42x86 rectangle at position (293, 93) then Renders a magenta line between points (202, 232) and (481, 180) then Places a cyan circle of radius 51 at center (371, 57).
; PLAN: r0=293(x), r1=93(y), r2=42(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x1), r6=232(y1), r7=481(x2), r8=180(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=57(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 293
LDI r1, 93
LDI r2, 42
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 232
LDI r7, 481
LDI r8, 180
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 57
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
