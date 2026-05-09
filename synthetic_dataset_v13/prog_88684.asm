; DESCRIPTION: Places a green 39x37 rectangle at position (161, 215).
; PLAN: r0=161(x), r1=215(y), r2=39(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 215
LDI r2, 39
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
