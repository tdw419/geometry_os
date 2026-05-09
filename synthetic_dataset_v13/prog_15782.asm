; DESCRIPTION: Renders a cyan box of size 21x47 starting at (81, 162).
; PLAN: r0=81(x), r1=162(y), r2=21(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 162
LDI r2, 21
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
