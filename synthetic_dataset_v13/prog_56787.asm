; DESCRIPTION: Renders a cyan box of size 83x69 starting at (186, 134).
; PLAN: r0=186(x), r1=134(y), r2=83(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 134
LDI r2, 83
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
