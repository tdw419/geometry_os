; DESCRIPTION: Renders a green box of size 110x104 starting at (401, 117).
; PLAN: r0=401(x), r1=117(y), r2=110(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 117
LDI r2, 110
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
