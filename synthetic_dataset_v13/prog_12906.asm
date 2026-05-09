; DESCRIPTION: Renders a cyan box of size 21x100 starting at (243, 64).
; PLAN: r0=243(x), r1=64(y), r2=21(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 64
LDI r2, 21
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
