; DESCRIPTION: Renders a cyan box of size 43x95 starting at (422, 136).
; PLAN: r0=422(x), r1=136(y), r2=43(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 136
LDI r2, 43
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
