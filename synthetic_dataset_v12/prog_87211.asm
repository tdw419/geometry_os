; DESCRIPTION: Places a green 71x50 rectangle at position (146, 114).
; PLAN: r0=146(x), r1=114(y), r2=71(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 114
LDI r2, 71
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
