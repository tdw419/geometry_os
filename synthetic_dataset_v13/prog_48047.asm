; DESCRIPTION: Places a red 37x113 rectangle at position (302, 127).
; PLAN: r0=302(x), r1=127(y), r2=37(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 127
LDI r2, 37
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
