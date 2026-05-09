; DESCRIPTION: Renders a cyan box of size 58x46 starting at (69, 168).
; PLAN: r0=69(x), r1=168(y), r2=58(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 168
LDI r2, 58
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
