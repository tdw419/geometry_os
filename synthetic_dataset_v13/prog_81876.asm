; DESCRIPTION: Renders a cyan box of size 77x75 starting at (401, 77).
; PLAN: r0=401(x), r1=77(y), r2=77(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 77
LDI r2, 77
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
