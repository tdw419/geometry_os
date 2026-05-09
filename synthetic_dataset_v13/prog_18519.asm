; DESCRIPTION: Renders a cyan box of size 83x29 starting at (243, 199).
; PLAN: r0=243(x), r1=199(y), r2=83(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 199
LDI r2, 83
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
