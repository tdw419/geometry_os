; DESCRIPTION: Renders a white box of size 38x31 starting at (404, 117).
; PLAN: r0=404(x), r1=117(y), r2=38(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 117
LDI r2, 38
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
