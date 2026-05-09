; DESCRIPTION: Places a cyan 28x39 rectangle at position (108, 213).
; PLAN: r0=108(x), r1=213(y), r2=28(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 213
LDI r2, 28
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
