; DESCRIPTION: Renders a red box of size 19x16 starting at (422, 120).
; PLAN: r0=422(x), r1=120(y), r2=19(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 120
LDI r2, 19
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
