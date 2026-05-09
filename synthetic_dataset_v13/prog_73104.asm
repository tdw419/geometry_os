; DESCRIPTION: Renders a green box of size 43x70 starting at (403, 31).
; PLAN: r0=403(x), r1=31(y), r2=43(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 31
LDI r2, 43
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
