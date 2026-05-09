; DESCRIPTION: Renders a cyan box of size 78x107 starting at (401, 62).
; PLAN: r0=401(x), r1=62(y), r2=78(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 62
LDI r2, 78
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
