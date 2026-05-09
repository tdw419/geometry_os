; DESCRIPTION: Composite: Creates a cyan rectangular region at (41, 86) spanning 17 by 84 pixels then Places a red dot at position (82, 133) then Renders a cyan line between points (27, 195) and (218, 148).
; PLAN: r0=41(x), r1=86(y), r2=17(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=133(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=27(x1), r11=195(y1), r12=218(x2), r13=148(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 86
LDI r2, 17
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 133
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 27
LDI r11, 195
LDI r12, 218
LDI r13, 148
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
