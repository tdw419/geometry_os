; DESCRIPTION: Renders a cyan box of size 58x21 starting at (54, 54).
; PLAN: r0=54(x), r1=54(y), r2=58(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 54
LDI r2, 58
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
