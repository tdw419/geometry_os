; DESCRIPTION: Places a green 67x91 rectangle at position (301, 16).
; PLAN: r0=301(x), r1=16(y), r2=67(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 16
LDI r2, 67
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
