; DESCRIPTION: Renders a red box of size 64x50 starting at (422, 35).
; PLAN: r0=422(x), r1=35(y), r2=64(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 35
LDI r2, 64
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
