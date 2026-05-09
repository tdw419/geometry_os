; DESCRIPTION: Composite: Renders a cyan line between points (354, 114) and (502, 177) then Sets a single red pixel at (40, 242) then Renders a green box of size 28x89 starting at (366, 91).
; PLAN: r0=354(x1), r1=114(y1), r2=502(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=242(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=91(y), r12=28(width), r13=89(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 114
LDI r2, 502
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 242
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 366
LDI r11, 91
LDI r12, 28
LDI r13, 89
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
