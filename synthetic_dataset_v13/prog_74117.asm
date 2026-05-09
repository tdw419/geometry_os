; DESCRIPTION: Places a cyan 108x25 rectangle at position (340, 0).
; PLAN: r0=340(x), r1=0(y), r2=108(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 0
LDI r2, 108
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
