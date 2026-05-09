; DESCRIPTION: Places a green 92x108 rectangle at position (365, 91).
; PLAN: r0=365(x), r1=91(y), r2=92(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 91
LDI r2, 92
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
