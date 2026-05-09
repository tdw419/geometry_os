; DESCRIPTION: Fills the screen with a vertical white gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(width), r4=256(height), r7=0xFFFFFF(color). CMP stores result in r0.
LDI r7, 0xFFFFFF
LDI r1, 0
y_loop:
LDI r2, 0
x_loop:
PSET r2, r1, r7
LDI r5, 1
ADD r2, r5
LDI r6, 512
CMP r2, r6
BLT r0, x_loop
LDI r5, 1
ADD r1, r5
LDI r6, 256
CMP r1, r6
BLT r0, y_loop
HALT
