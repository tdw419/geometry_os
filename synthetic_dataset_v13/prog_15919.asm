; DESCRIPTION: Places a green 62x25 rectangle at position (302, 171).
; PLAN: r0=302(x), r1=171(y), r2=62(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 171
LDI r2, 62
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
