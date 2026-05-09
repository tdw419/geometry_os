; DESCRIPTION: Places a cyan 80x25 rectangle at position (400, 164).
; PLAN: r0=400(x), r1=164(y), r2=80(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 164
LDI r2, 80
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
