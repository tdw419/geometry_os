; DESCRIPTION: Renders a cyan box of size 28x30 starting at (176, 221).
; PLAN: r0=176(x), r1=221(y), r2=28(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 221
LDI r2, 28
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
