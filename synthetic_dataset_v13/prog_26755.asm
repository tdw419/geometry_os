; DESCRIPTION: Renders a orange box of size 79x109 starting at (422, 94).
; PLAN: r0=422(x), r1=94(y), r2=79(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 94
LDI r2, 79
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
