; DESCRIPTION: Renders a red box of size 14x32 starting at (422, 142).
; PLAN: r0=422(x), r1=142(y), r2=14(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 142
LDI r2, 14
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
