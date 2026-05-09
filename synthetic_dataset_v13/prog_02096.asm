; DESCRIPTION: Renders a cyan box of size 85x57 starting at (161, 48).
; PLAN: r0=161(x), r1=48(y), r2=85(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 48
LDI r2, 85
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
