; DESCRIPTION: Creates a black rectangular region at (401, 120) spanning 80 by 38 pixels.
; PLAN: r0=401(x), r1=120(y), r2=80(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 120
LDI r2, 80
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
