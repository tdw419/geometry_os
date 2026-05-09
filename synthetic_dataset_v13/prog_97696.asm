; DESCRIPTION: Renders a cyan box of size 48x58 starting at (233, 30).
; PLAN: r0=233(x), r1=30(y), r2=48(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 30
LDI r2, 48
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
