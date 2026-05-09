; DESCRIPTION: Places a green 50x71 rectangle at position (393, 50).
; PLAN: r0=393(x), r1=50(y), r2=50(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 50
LDI r2, 50
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
