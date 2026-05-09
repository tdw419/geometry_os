; DESCRIPTION: Places a green 98x54 rectangle at position (307, 59).
; PLAN: r0=307(x), r1=59(y), r2=98(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 59
LDI r2, 98
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
