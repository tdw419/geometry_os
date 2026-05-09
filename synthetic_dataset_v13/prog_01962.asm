; DESCRIPTION: Renders a green box of size 56x79 starting at (403, 117).
; PLAN: r0=403(x), r1=117(y), r2=56(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 117
LDI r2, 56
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
