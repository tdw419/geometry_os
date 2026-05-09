; DESCRIPTION: Places a red 91x102 rectangle at position (243, 28).
; PLAN: r0=243(x), r1=28(y), r2=91(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 28
LDI r2, 91
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
