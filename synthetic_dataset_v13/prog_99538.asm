; DESCRIPTION: Composite: Renders a red line between points (87, 69) and (374, 33) then Sets a single cyan pixel at (258, 42) then Renders a cyan box of size 93x88 starting at (209, 146).
; PLAN: r0=87(x1), r1=69(y1), r2=374(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=146(y), r12=93(width), r13=88(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 69
LDI r2, 374
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 209
LDI r11, 146
LDI r12, 93
LDI r13, 88
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
