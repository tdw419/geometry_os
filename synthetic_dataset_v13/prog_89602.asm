; DESCRIPTION: Renders a green box of size 12x48 starting at (401, 187).
; PLAN: r0=401(x), r1=187(y), r2=12(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 187
LDI r2, 12
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
