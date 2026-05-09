; DESCRIPTION: Renders a cyan box of size 29x10 starting at (255, 221).
; PLAN: r0=255(x), r1=221(y), r2=29(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 221
LDI r2, 29
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
