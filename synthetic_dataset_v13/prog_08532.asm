; DESCRIPTION: Renders a cyan box of size 58x54 starting at (406, 68).
; PLAN: r0=406(x), r1=68(y), r2=58(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 68
LDI r2, 58
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
