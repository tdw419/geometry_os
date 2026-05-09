; DESCRIPTION: Renders a green box of size 33x12 starting at (401, 196).
; PLAN: r0=401(x), r1=196(y), r2=33(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 196
LDI r2, 33
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
