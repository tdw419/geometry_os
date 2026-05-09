; DESCRIPTION: Renders a cyan box of size 54x13 starting at (144, 124).
; PLAN: r0=144(x), r1=124(y), r2=54(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 124
LDI r2, 54
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
