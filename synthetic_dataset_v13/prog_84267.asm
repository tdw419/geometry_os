; DESCRIPTION: Composite: Places a magenta 66x93 rectangle at position (413, 79) then Places a magenta dot at position (501, 229) then Places a magenta line segment connecting (310, 78) to (82, 172).
; PLAN: r0=413(x), r1=79(y), r2=66(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x), r6=229(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=310(x1), r11=78(y1), r12=82(x2), r13=172(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 79
LDI r2, 66
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 229
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 310
LDI r11, 78
LDI r12, 82
LDI r13, 172
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
