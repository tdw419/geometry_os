; DESCRIPTION: Renders a white box of size 25x27 starting at (403, 79).
; PLAN: r0=403(x), r1=79(y), r2=25(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 79
LDI r2, 25
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
