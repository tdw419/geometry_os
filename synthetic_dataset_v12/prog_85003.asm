; DESCRIPTION: Places a cyan 98x90 rectangle at position (243, 0).
; PLAN: r0=243(x), r1=0(y), r2=98(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 0
LDI r2, 98
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
