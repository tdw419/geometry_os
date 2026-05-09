; DESCRIPTION: Renders a cyan box of size 54x48 starting at (151, 58).
; PLAN: r0=151(x), r1=58(y), r2=54(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 58
LDI r2, 54
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
