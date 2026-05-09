; DESCRIPTION: Places a green 16x75 rectangle at position (479, 21).
; PLAN: r0=479(x), r1=21(y), r2=16(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 21
LDI r2, 16
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
