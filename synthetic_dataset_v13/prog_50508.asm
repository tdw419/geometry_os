; DESCRIPTION: Composite: Creates a orange rectangular region at (241, 197) spanning 11 by 19 pixels then Places a magenta line segment connecting (320, 162) to (503, 213).
; PLAN: r0=241(x), r1=197(y), r2=11(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x1), r6=162(y1), r7=503(x2), r8=213(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 197
LDI r2, 11
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 162
LDI r7, 503
LDI r8, 213
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
