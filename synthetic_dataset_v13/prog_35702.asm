; DESCRIPTION: Renders a cyan box of size 40x33 starting at (401, 49).
; PLAN: r0=401(x), r1=49(y), r2=40(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 49
LDI r2, 40
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
