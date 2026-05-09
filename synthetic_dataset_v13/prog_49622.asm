; DESCRIPTION: Renders a orange box of size 63x60 starting at (422, 173).
; PLAN: r0=422(x), r1=173(y), r2=63(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 173
LDI r2, 63
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
