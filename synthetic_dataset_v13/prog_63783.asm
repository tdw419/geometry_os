; DESCRIPTION: Renders a cyan box of size 46x80 starting at (61, 18).
; PLAN: r0=61(x), r1=18(y), r2=46(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 18
LDI r2, 46
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
