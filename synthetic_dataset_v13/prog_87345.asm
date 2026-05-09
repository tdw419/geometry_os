; DESCRIPTION: Renders a cyan box of size 24x27 starting at (401, 216).
; PLAN: r0=401(x), r1=216(y), r2=24(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 216
LDI r2, 24
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
