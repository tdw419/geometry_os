; DESCRIPTION: Composite: Places a purple 91x61 rectangle at position (39, 115) then Places a green dot at position (164, 242).
; PLAN: r0=39(x), r1=115(y), r2=91(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=242(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 39
LDI r1, 115
LDI r2, 91
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 242
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
