; DESCRIPTION: Composite: Renders a blue line between points (96, 60) and (117, 71) then Places a magenta dot at position (267, 174) then Renders a magenta box of size 66x48 starting at (352, 180).
; PLAN: r0=96(x1), r1=60(y1), r2=117(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=174(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=352(x), r11=180(y), r12=66(width), r13=48(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 60
LDI r2, 117
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 174
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 352
LDI r11, 180
LDI r12, 66
LDI r13, 48
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
