; DESCRIPTION: Places a cyan 120x39 rectangle at position (255, 133).
; PLAN: r0=255(x), r1=133(y), r2=120(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 133
LDI r2, 120
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
